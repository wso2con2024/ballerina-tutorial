/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import AuthorPage from "./pages/AuthorPage"
import Errorpage from "./pages/ErrorPage"
import PlacePage from "./pages/PlacePage"
import PlacesPage from "./pages/PlacesPage"
import {
  BrowserRouter,
  Route,
  Routes
} from "react-router-dom"

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<PlacesPage />} />
        <Route path="/place/:placeId" element={<PlacePage />} />
        <Route path="/author/:authorId" element={<AuthorPage />} />
        <Route path="/*" element={<Errorpage />} />
      </Routes>
    </BrowserRouter>
  )
}
